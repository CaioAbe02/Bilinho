class CreateEnrollmentBills
    include UseCase

    attr_reader :enrollment, :valor_bill, :dia_vencimento, :vencimento_bill

    def initialize(enrollment)
        @enrollment = enrollment
    end

    def perform
        define_valor_bill
        define_dia_vencimento
        create_bills
    end

    private

    def define_valor_bill
        @valor_bill = enrollment[:valor_curso] / enrollment[:qtd_bills]
    end

    def define_dia_vencimento
        @dia_vencimento = enrollment[:dia_vencimento_bill].to_i
    end

    def define_vencimento_bill(num_bill)
        @vencimento_bill = Date.today + num_bill.month

        if @dia_vencimento == 31
            @vencimento_bill.end_of_month
        elsif (@dia_vencimento == 30 || @dia_vencimento == 29) && @vencimento_bill.month == 2
            @vencimento_bill.end_of_month
        else
            @vencimento_bill.change(day: @dia_vencimento)
        end

    end

    def create_bills
        enrollment.qtd_bills.times do |i|
            Bill.create!(
                :valor => @valor_bill,
                :data_vencimento => define_vencimento_bill(i+1),
                :enrollment_id => enrollment.id,
                :status => 'Aberta'
            )
        end
    end
end
class BoatingTest

    attr_reader :student, :test_name, :instructor
    attr_accessor :test_status

    @@all = []

    def initialize(student, test_name, test_status, instructor)
        @student = student
        @test_name = test_name
        @instructor = instructor
        @@all << self
    end

   def self.all
    @@all
   end
    

end

class Student

    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
    @@all 
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def tests
        BoatingTest.all.select{|test| test.student == self}
    end

    # def all_instructors
    #     BoatingTest.all.select{|instructor| instructor.student == self}.uniq
    # end

    def all_instructors
        self.tests.map{|test| test.instructor}.uniq
    end

    def self.find_student(first_name)
        self.all.find{|student| student.first_name == first_name}
    end

    def grade_percentage
        pass = 0
        self.tests.each do |test|
            if test.test_staus == "passed"
                pass = pass +=1
            end
        end
        pass.to_f/self.tests.length.to_f * 100
    end

        




end

class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def all_tests
        BoatingTest.all.select{|tests| test.instructor == self}
    end

    def all_students
        self.all_tests.map{|test| test.student}.uniq
    end

    # def passed_student
    #     BoatingTest.all.select{|test_status| test_status.student == "passed"}
    # end

    def passed_student
        passed_test = self.all_tests.select{|test| test.test_status == "passed"}
        passed_test.map{|test| test.sudent}.uniq
    end

    def pass_student(student, test_name)
        student_test = BoatingTest.all.find{|test| test.student == student && test.test_name == test_name}
        if student_test
            student_test.test_status = "passed"
        else
            BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        student_test = BoatingTest.all.find{|test| test.student == student && test.test_name == test_name}
        if student_test
            student_test.test_status = "failed"
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    end



end

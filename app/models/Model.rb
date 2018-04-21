include Math


class User
    attr_accessor(:level, :currentXp, :nextLevel, :attendanceStreak)
    attr_reader(:achievements)
    def initialize(id, name, department)
        @level = 1
        @currentXp = 0
        @nextLevel = 50
        @attendanceStreak = 0
        @id = id
        @name = name
        @department = department
        @achievements = instantiateAchievements
    end

    def instantiateAchievements
        array = Array.new
        array + Milestone("Weakly Streak", 10).generateMilestones(10, 5)
        print array
        return array
    end

    def giveXp(x)
        @currentXp += x
        if @currentXp >= @nextLevel
            @level += 1
            @nextlevel = @nextLevel * (1+log2(level))
        end
    end

    def getValues(param)
        return @currentXp
    end

    def endStreak(x)
        @attendanceStreak = 0
    end
    
    def incrementStreak
        @attendanceStreak += 1
    end
end

class Achievement
    attr_accessor(:name, :xp)
    attr_reader(:achieved)
    def initialize(name, xp)
        @xp = xp
        @name = name
        @goal = 50
        @achieved = false
    end

    def compareValues(user)
        return user.getValues(@name).equal?(@goal)
    end

    def giveAchievement(user)
        user.achievements.push(@name)
        user.giveXp(@xp)
        @achieved = true
    end
end

class Milestone < Achievement
    attr_accessor(:name, :xp)
    attr_reader(:achieved)
    def initialize
        super(@name, @xp)
    end

    def generateMilestones(amount, factor)
        array = Array.new
        i = 0
        while i < amount
            array.push(Achievement(@name + " " + i, i * factor))
            i += 1
        end
        return array
    end
end



#Test Space

instance = User.new(17, 'Tom','Back Area')
george = User.new(18,'Steve', 'Dev Team')
puts instance.level
instance.giveXp(50)

shiftHero = Achievement.new('Shift Hero', 100)
shiftHero.giveAchievement(instance)
shiftHero.giveAchievement(george)
puts instance.level
puts instance.achievements
puts george.level
puts george.achievements

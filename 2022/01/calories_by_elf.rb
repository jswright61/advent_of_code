class CaloriesByElf
  class << self

    def by_elf
      @@by_elf ||= begin
        by_elf = []
        sum = 0
        File.read("./data/carried_by_elf.txt").each_line do |ln, i|
          if ln == "\n"
            by_elf << sum if sum > 0
            sum = 0
          else
            sum += ln.to_i
          end
        end
        by_elf << sum unless sum == 0
        by_elf
      end

    end

    def max
      by_elf.max
    end

    def top_3
      by_elf.sort[-3..].sum
    end
  end
end
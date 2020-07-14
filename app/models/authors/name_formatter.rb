module Authors
  module NameFormatter
    extend self

    AGNOMES = Set['filho', 'filha', 'neto', 'neta', 'sobrinho', 'sobrinha', 'junior']
    PREPOSITION_LAST_NAME = Set['da', 'de', 'do', 'das', 'dos']

    def call(authors)
      formated_author_name = authors.map { |author| format(author) }
    end

    private

      def format(author)
        splited_name = author.split(' ').map(&:downcase)

        if AGNOMES.include?(splited_name.last) && splited_name.size > 2
          first_name = format_first_name(splited_name, 2)
          last_name = splited_name.last(2).join(' ').upcase
        else
          first_name = format_first_name(splited_name, 1)
          last_name = splited_name.last.upcase
        end

        {
          first_name: first_name,
          last_name: last_name,
          formatted_name: first_name.empty? ? "#{last_name}" : "#{last_name}, #{first_name}"
        }
      end

      def format_first_name(splited_name, last_name_size)
        splited_name.first(splited_name.size - last_name_size).map do |fn|
          capitalize_first_name(fn)
        end.join(' ')
      end

      def capitalize_first_name(first_name)
        PREPOSITION_LAST_NAME.any?(first_name) ? first_name : first_name.capitalize
      end
  end
end
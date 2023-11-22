module Lrama
  class Grammar
    class ParameterizingRules
      class Builder
        # Builder for nonempty list of general parameterizing rules
        class NonemptyList < Base

          # program: nonempty_list(number)
          #
          # =>
          #
          # program: nonempty_list_number
          # nonempty_list_number: number
          # nonempty_list_number: nonempty_list_number number
          def build
            validate_argument_number!

            rules = []
            nonempty_list_token = Lrama::Lexer::Token::Ident.new(s_value: "nonempty_list_#{@token.s_value}")
            rules << Rule.new(id: @rule_counter.increment, _lhs: @lhs, _rhs: [nonempty_list_token], token_code: @user_code, precedence_sym: @precedence_sym, lineno: @line)
            rules << Rule.new(id: @rule_counter.increment, _lhs: nonempty_list_token, _rhs: [@token], token_code: @user_code, precedence_sym: @precedence_sym, lineno: @line)
            rules << Rule.new(id: @rule_counter.increment, _lhs: nonempty_list_token, _rhs: [nonempty_list_token, @token], token_code: @user_code, precedence_sym: @precedence_sym, lineno: @line)
            rules
          end
        end
      end
    end
  end
end

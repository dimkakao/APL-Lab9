require_relative 'rules_validator'
require_relative 'data_validator'
require_relative 'entities'


# Є правило, яке перевизначає метод з 1 вхідним значенням і окремо атрибут і до цього модна додати правило у масив правил
validation_rules = ValidationRuleDSL.new

validation_rules.add_validation_rule(:username) do
  presence message: 'Username cannot be blank'
  length minimum: 3, maximum: 20
end

validation_rules.add_validation_rule(:email) do
  presence message: 'Email cannot be blank'
end

validation_rules.add_validation_rule(:age) do
  presence message: 'Age cannot be nil'
  numericality minimum: 18, maximum: 100
end

validation_rules.add_validation_rule(:qqq) do
  presence message: 'Age cannot be nil'
  numericality minimum: 18, maximum: 100
end

rules = validation_rules.generate

validator = DataValidator.new(rules)

data_to_validate = {
  username: "JohnDoe",
  email: "",
  age: nil
}

person_to_validate = Person.new("JohnDoe", "john.doe@example.com", 20)

data_to_validate = object_to_hash(person_to_validate)
is_valid = validator.validate_data(data_to_validate)
puts "\nIs valid? -> #{is_valid}"
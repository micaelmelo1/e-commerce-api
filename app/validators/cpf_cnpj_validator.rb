# frozen_string_literal: true

require 'cpf_cnpj'

class CpfCnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?

    return if CPF.valid?(value) || CNPJ.valid?(value)

    record.errors.add(attribute, :invalid_cpf_cnpj)
  end
end

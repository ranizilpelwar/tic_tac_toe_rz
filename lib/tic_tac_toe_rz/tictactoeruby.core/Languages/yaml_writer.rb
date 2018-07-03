require 'yaml'
require_relative './yaml_reader.rb'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module Languages
    module YAMLWriter
      def self.write_data(file_path, property, value)
        raise Exceptions::NilReferenceError, "file_path" if file_path.nil?
        raise Exceptions::InvalidValueError, "file_path" if file_path == ""
        file_path = File.dirname(__FILE__) + '/' + file_path
        raise Exceptions::InvalidValueError, "file" if !(File.exist?(file_path))
        raise Exceptions::NilReferenceError, "property" if property.nil?
        raise Exceptions::InvalidValueError, "property" if property == ""
        raise Exceptions::NilReferenceError, "value" if value.nil?
        raise Exceptions::InvalidValueError, "value" if value == ""
        yaml_file = YAML.load_file(file_path)
        yaml_file[property] = value
        length_written = File.write(file_path, yaml_file.to_yaml)
        raise Exceptions::InvalidValueError if length_written == 0
      end
    end
  end
end
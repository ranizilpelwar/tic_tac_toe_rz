require 'yaml'
require_relative '../../tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../tictactoeruby.core/exceptions/invalid_value_error.rb'

module TicTacToeRZ
  module Languages
    module YAMLReader
      def self.read_data(file_path, property)
        raise Exceptions::NilReferenceError, "file_path" if file_path.nil?
        raise Exceptions::InvalidValueError, "file_path" if file_path == ""
        file_path = File.dirname(__FILE__) + '/' + file_path
        raise Exceptions::InvalidValueError, "file_path = #{file_path}" if !(File.exist?(file_path))
        raise Exceptions::NilReferenceError, "property" if property.nil?
        raise Exceptions::InvalidValueError, "property" if property == ""
        yaml_file = YAML.load_file(file_path)
        data = yaml_file[property]
        raise Exceptions::InvalidValueError, property.to_s if data.nil?
        yaml_content = data
      end
    end
  end
end

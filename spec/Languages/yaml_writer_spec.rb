require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/languages/yaml_writer.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/nil_reference_error.rb'
require_relative '../../lib/tic_tac_toe_rz/tictactoeruby.core/exceptions/invalid_value_error.rb'

RSpec.describe "a yaml writer" do
  context "method called write_data" do
    it "updates the yaml content when a valid file path and property name are provided" do
      file_path = "../../../../spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = DateTime.now.to_s
      TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value)
      file_path = File.dirname(__FILE__) + '/' + "../TestFiles/testing.en.yaml"
      yaml_file = YAML.load_file(file_path)
      actual_value = yaml_file[property]
      expect(actual_value).to eq(value)
    end

    it "raises a NilReferenceError when file_path is nil" do
      file_path = nil
      property = "test_property"
      value = DateTime.now.to_s
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a NilReferenceError when property is nil" do
      file_path = "../../../../spec/TestFiles/testing.en.yaml"
      property = nil
      value = DateTime.now.to_s
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises a NilReferenceError when value is nil" do
      file_path = "../../../../spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = nil
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::NilReferenceError)
    end

    it "raises an InvalidValueError when file_path is empty" do
      file_path = ""
      property = "test_property"
      value = DateTime.now.to_s
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when property is empty" do
      file_path = "../../../../spec/TestFiles/testing.en.yaml"
      property = ""
      value = DateTime.now.to_s
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when value is empty" do
      file_path = "../../../../spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = ""
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when file is non-existent" do
      file_path = "../../../../spec/TestFiles/testing1.en.yaml"
      property = "test_property"
      value = DateTime.now.to_s
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end

    it "raises an InvalidValueError when nothing is written to the file" do
      file_path = "../../../../spec/TestFiles/testing.en.yaml"
      property = "test_property"
      value = ""
      expect{ TicTacToeRZ::Languages::YAMLWriter.write_data(file_path, property, value) }.to raise_error(TicTacToeRZ::Exceptions::InvalidValueError)
    end
  end
end
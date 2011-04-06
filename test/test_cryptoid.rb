require 'test/unit'
require 'cryptoid'

class TestCryptoid < Test::Unit::TestCase
  def root_path
    File.dirname(File.expand_path(__FILE__))
  end

  def test_generate_key
    # delete the keys if they exist in the test dir
    File.delete("#{root_path}/rsa/id_rsa") if File.exists?("#{root_path}/rsa/id_rsa")
    File.delete("#{root_path}/rsa/id_rsa.pub") if File.exists?("#{root_path}/rsa/id_rsa.pub")

    encrypter = Cryptoid.new(root_path)
    assert true, File.exists?("#{root_path}/rsa/id_rsa")
    assert true, File.exists?("#{root_path}/rsa/id_rsa.pub")

    File.delete("#{root_path}/rsa/id_rsa")
    File.delete("#{root_path}/rsa/id_rsa.pub")
  end

  def test_encrypt_decrypt_string
    encrypter = Cryptoid.new(root_path)
    test = encrypter.encrypt_string("test string")
    assert_equal "test string", encrypter.decrypt_string(test)
    File.delete("#{root_path}/rsa/id_rsa")
    File.delete("#{root_path}/rsa/id_rsa.pub")
  end

  def test_bad_data_path
    assert_raise(CryptoidError) { Cryptoid.new("/bad/file/path") }
  end
end

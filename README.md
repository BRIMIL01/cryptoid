Cryptoid
====================
A small little library for encrypting and decrypting strings. It will also create a public/private key pair if one does not exists already.

Initialize cryptoid:

    crypter = Cryptoid.new(path_to_folder_with_keys)
    
Throw a string into it:

    crypter.encrypt_string("a string")
    
To decrypt an encrypted string:

    crypter.encrypt_string(encrypted_string)

TODO
-------------------
Write tests (surprise!)
Make a gem (overkill?)


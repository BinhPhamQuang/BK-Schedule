import 'dart:convert';

import 'package:encrypt/encrypt.dart';


final key ='ZmDfcTF7_60GrrY167zazPd67pEvs0aGOv2oasOM1Pg=';
final iv= IV.fromLength(32);
final b64key=Key.fromBase64(key);
final fernet= Fernet(b64key);
final encrypter= Encrypter(fernet);

String encryptFernet(String plainText)
{
  return encrypter.encrypt(plainText).base64;
}

String decryptFernet(String cipherText)
{
  Encrypted tt=  Key.fromBase64(cipherText);
  return encrypter.decrypt(tt);
}
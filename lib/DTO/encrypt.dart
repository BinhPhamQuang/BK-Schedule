import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';







final key ='ZmDfcTF7_60GrrY167zazPd67pEvs0aGOv2oasOM1Pg=';
final iv= IV.fromLength(32);
final b64key=Key.fromBase64(key);
final fernet= Fernet(b64key);
final encrypter= Encrypter(fernet);




String encryptRSA(String plainText)
{
  const String publicKey="""-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCDl2jeQfWzb1Hajbg+PfDw3oUs
To1Xfj/TB0L/2+xgPE+uZKEHEUMZ17AxiRHYcrh/6n6lvWC73Sg6xR8KyhwnjHb8
+dq8iyniGElMAj5vTune7N+RMQUUa98JeGrb9ZxPv4ZM8pbCaTRIZRobBhDHUYG6
B4jbSVCjGj2XuOBWewIDAQAB
-----END PUBLIC KEY-----""";
  RSAPublicKey  pubKey= RSAKeyParser().parse(publicKey) as RSAPublicKey;
  final encrypterRSA= Encrypter(RSA(publicKey: pubKey));
  return encrypterRSA.encrypt(plainText).base64;
}

String encryptFernet(String plainText)
{
  return encrypter.encrypt(plainText).base64;
}

String decryptFernet(String cipherText)
{
  Encrypted tt=  Key.fromBase64(cipherText);
  return encrypter.decrypt(tt);
}
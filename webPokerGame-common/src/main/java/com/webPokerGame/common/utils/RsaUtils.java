package com.webPokerGame.common.utils;

import org.apache.commons.codec.binary.Base64;
import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * RSA加密解密
 *
 * @author ruoyi
 **/
public class RsaUtils
{
    // Rsa 私钥
    public static String privateKey = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCk82KCgGlaygIQ" +
            "pjEsJHP0kJcfzQFQvFoVG9bBStuPjuTAc3/LbbH9ro+CXF1njvQVFWaRKV76Usf9" +
            "x+A86+x/5O84z81al6FrvUEYT1KWeMP85clxwzl0AtTht1+zY+Sq6MeZMJl/ehCG" +
            "3Xul9bDrPx7y2rP+cQtZOX2RTUGCQKH8B47+mNgMVgpohugSshlvqFKcgOaP6/lH" +
            "lPq8Y+jIhvPDC3Hw0ONwMaHTEeYZ66sFnvWZn8zwu3BdxE0Nadm7xtvyFVlehWyS" +
            "ogfhr9lQYWhYhLOL1Au6OkWzwpMx94sNJLcuOznw5K5U1ziPFoCES2Ajdd5+iAef" +
            "/aRXu4/ZAgMBAAECggEBAJauCjACU7tuy0IgPsz/I7mmF5ciM3BoDrY3rw71beoO" +
            "82HmYDgZpb2CJ3BDJcQC728PFJnIPA3Zbv2iB3I/ZdRS8kBoe0OlPfzobj1hwKTZ" +
            "/tbXphQ47RPPvl3OoCqENw/1AtgqcB3mCJDaZChvbsUG7SOVq1TkOSSxgsYn146+" +
            "OeBPoxG2MEXsCa6tNYn1TnpFsaASMFCKjs7odENp4QNBBv+hB5/nR12+iLH8N3GF" +
            "CWNFv0KvmNQW0f8OVM5oCK53ABT0h9HH9DLXZ62krAmsADvGgaL88kdoFJ92vC/9" +
            "jCvKxbOOU/rZeIuWBwErdwtdgsvkS83hX0OBff/TEYECgYEA2iAaUqY7RSuaaT0o" +
            "F4DZBLuPGpfxlo5Aq/U1KqrXZb8ucnp73R6VXhFLC3PCCMk+hNkScQTdlhuDbbUc" +
            "i1Yoy+3yU51sSGFFSym+nhX+0i3uEzBSe7fZwKjcf5xh2SSSjj41l9dPOiSWyklH" +
            "dRm9tWjsKH2qvoSVvKwK+QFOuRECgYEAwZec8xA50RHUjpHEdTEqPGjJSzf9ZEW3" +
            "S43Bh8+RPUzxXzIK5U6fKIXNHv4xScoMZXj0WVa/IP72yk3UHR6b9uLSut3LNURJ" +
            "bDNMDo9DiMTLUasr3Kmr2tFITrLyXpdNIm7EoNUoZ/FdGogUmo1Lp/mO3rtlae+R" +
            "R31hSE8sKkkCgYEAlipPtOKYH1CbZyQhO70KqsVtCYPdYCbiwv928L7Yt0Vc9pb4" +
            "OwxZDH+fSG0TAfV5wv+mQIR3AGZEnvx2gD56q5pOn93atCGzEMHWZwMBgTT5l+BG" +
            "iMHTeV1HH9tLSbBx7NdLEhO6iW6zGORF+4oTHpbzLhUFvU+Nvmw6yZ5q0eECgYEA" +
            "h0FCKp//hQ6MDz/QnoBHHgWn/aGUq+X5dhQITra6prWHPhdcfXE8ybcR5MF79i3w" +
            "E0U6kuCEkK0SB63wsJeeKBO5X01umDypf6snTFTTvk6gLuMEthrlMvBdMH7dzzCu" +
            "d4wkXKoQnO6JOewxWPm3DhjRtNQAus7iFayHt1l5ZeECgYBlPQieoQHWyowhwboq" +
            "E7qLfLbOWilusCuCJasnOemcXbfgtLeuyCWYh9UuPxiEFhpb4/eL28d13AEVzbMj" +
            "zKKoDB7ZEZUKygKDgMQBkOkiOOq0CGYdcLx3Pl1VC7oJcCoEtc7hmfq8zoLsVkwC" +
            "rdtIx/rCOtkh//QruAwUETNI4w==";

    /**
     * 私钥解密
     *
     * @param privateKeyString 私钥
     * @param text 待解密的文本
     * @return 解密后的文本
     */
    public static String decryptByPrivateKey(String text) throws Exception
    {
        return decryptByPrivateKey(privateKey, text);
    }

    /**
     * 公钥解密
     *
     * @param publicKeyString 公钥
     * @param text 待解密的信息
     * @return 解密后的文本
     */
    public static String decryptByPublicKey(String publicKeyString, String text) throws Exception
    {
        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(Base64.decodeBase64(text));
        return new String(result);
    }

    /**
     * 私钥加密
     *
     * @param privateKeyString 私钥
     * @param text 待加密的信息
     * @return 加密后的文本
     */
    public static String encryptByPrivateKey(String privateKeyString, String text) throws Exception
    {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(text.getBytes());
        return Base64.encodeBase64String(result);
    }

    /**
     * 私钥解密
     *
     * @param privateKeyString 私钥
     * @param text 待解密的文本
     * @return 解密后的文本
     */
    public static String decryptByPrivateKey(String privateKeyString, String text) throws Exception
    {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec5 = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec5);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(Base64.decodeBase64(text));
        return new String(result);
    }

    /**
     * 公钥加密
     *
     * @param publicKeyString 公钥
     * @param text 待加密的文本
     * @return 加密后的文本
     */
    public static String encryptByPublicKey(String publicKeyString, String text) throws Exception
    {
        X509EncodedKeySpec x509EncodedKeySpec2 = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec2);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(text.getBytes());
        return Base64.encodeBase64String(result);
    }

    /**
     * 构建RSA密钥对
     *
     * @return 生成后的公私钥信息
     */
    public static RsaKeyPair generateKeyPair() throws NoSuchAlgorithmException
    {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(1024);
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyPair.getPrivate();
        String publicKeyString = Base64.encodeBase64String(rsaPublicKey.getEncoded());
        String privateKeyString = Base64.encodeBase64String(rsaPrivateKey.getEncoded());
        return new RsaKeyPair(publicKeyString, privateKeyString);
    }

    /**
     * RSA密钥对对象
     */
    public static class RsaKeyPair
    {
        private final String publicKey;
        private final String privateKey;

        public RsaKeyPair(String publicKey, String privateKey)
        {
            this.publicKey = publicKey;
            this.privateKey = privateKey;
        }

        public String getPublicKey()
        {
            return publicKey;
        }

        public String getPrivateKey()
        {
            return privateKey;
        }
    }
}
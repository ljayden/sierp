package com.sierp.web.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

/**
 * 지원하는 암호화 방식 {@link Algorithm Algorithm.AES, Algorithm.TRIPLE_DES}
 */
public class CryptUtils {

    public static byte[] encryptBase64(byte[] key, byte[] plain, Algorithm algorithm, byte[] iv) 
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
        
        return encryptBase64(key, plain, algorithm, algorithm.getTransformation(), iv);
    }
    
    public static byte[] descryptBase64(byte[] key, byte[] base64EncodedPlainBytes, Algorithm algorithm, byte[] iv) 
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {

        return descryptBase64(key, base64EncodedPlainBytes, algorithm, algorithm.getTransformation(), iv);
    }
    
	/**
	 * 
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeyException
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 * @throws InvalidAlgorithmParameterException
	 */
    public static byte[] encryptBase64(byte[] key, byte[] plain, Algorithm algorithm, String transformation, byte[] iv) 
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
		
		SecretKeySpec secretKeySpec = new SecretKeySpec(key, algorithm.algorithmName);
		Cipher cipher = Cipher.getInstance(transformation);
		if (iv != null) {
		    cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, new IvParameterSpec(iv));
		} else {
		    cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
		}
		byte[] encData = cipher.doFinal(plain);
		return Base64.encodeBase64(encData);
	}
	
    
    /**
     * @param plain Base64 encoded text
     * @return
     * @throws NoSuchAlgorithmException
     * @throws NoSuchPaddingException
     * @throws InvalidKeyException
     * @throws UnsupportedEncodingException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */
    public static byte[] descryptBase64(byte[] key, byte[] base64EncodedPlainBytes, Algorithm algorithm, String transformation, byte[] iv) 
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
        

        SecretKeySpec secretKeySpec = new SecretKeySpec(key, algorithm.algorithmName);
        Cipher cipher = Cipher.getInstance(transformation);
        if (iv != null) {
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, new IvParameterSpec(iv));
        } else {
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
        }
        return cipher.doFinal(Base64.decodeBase64(base64EncodedPlainBytes));
    }
    
    public static byte[] encryptSHA256(String plain) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        return digest.digest(plain.getBytes("UTF-8"));
    }
    
    /**
     * 지원하는 암호화 방식및 모드
     *
     */
    public enum Algorithm {
        AES("AES", "AES/ECB/PKCS5Padding"),
        AES_CBC("AES", "AES/CBC/PKCS5Padding");
        
        private String algorithmName;
        private String transformation;
        
        private Algorithm(String algoName, String transformation) {
            this.algorithmName = algoName;
            this.transformation = transformation;
        }
        
        public String getAlgorithmName() {
            return this.algorithmName;
        }
        
        public String getTransformation() {
            return this.transformation;
        }
    }
    
}

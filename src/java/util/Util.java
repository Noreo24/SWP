/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Random;

/**
 *
 * @author LanChau
 */
public class Util {
    public static String generateRandomName(int length) {
        Random random = new Random();
        StringBuilder randomName = new StringBuilder();

        for (int i = 0; i < length; i++) {
            char randomChar = (char) ('A' + random.nextInt(26));
            randomName.append(randomChar);
        }

        return randomName.toString();
    }
}

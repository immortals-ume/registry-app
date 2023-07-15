package com.immortals.registryapp;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;


@SpringBootTest
class RegistryAppApplicationTests {

    @Value("${server.port}")
    private int serverPort;

    @Test
    void contextLoads() {
        assertEquals(8761, serverPort, "Server is not running on the expected port");
    }

}

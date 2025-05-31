package com.immortals.registryapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class RegistryAppApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(RegistryAppApplication.class, args);
	}
}

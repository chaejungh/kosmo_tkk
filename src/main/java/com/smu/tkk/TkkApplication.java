package com.smu.tkk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@EnableJpaRepositories(basePackages = "com.smu.tkk")

public class TkkApplication {

    public static void main(String[] args) {
        SpringApplication.run(TkkApplication.class, args);
    }

}

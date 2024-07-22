package com.training;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author training
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class TrainingApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(TrainingApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  员工培训平台启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}

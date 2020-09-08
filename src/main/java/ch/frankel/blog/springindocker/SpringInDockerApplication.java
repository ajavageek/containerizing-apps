package ch.frankel.blog.springindocker;

import com.hazelcast.config.Config;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringInDockerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringInDockerApplication.class, args);
    }

    @Bean
    public Config config() {
        return new Config();
    }

    @Bean
    public IMap<String, Long> greetings(HazelcastInstance hazelcast) {
        return hazelcast.getMap("people");
    }
}

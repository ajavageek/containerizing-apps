package ch.frankel.blog.springindocker;

import com.hazelcast.client.config.ClientConfig;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication(proxyBeanMethods=false)
public class SpringInDockerApplication {

    @Bean
    public ClientConfig config() {
        var config = new ClientConfig();
        // Assume the app runs inside Docker and Hazelcast runs on a Mac host
        config.getNetworkConfig()
              .addAddress("host.docker.internal");
        return config;
    }

    @Bean
    public IMap<String, Long> greetings(HazelcastInstance hazelcast) {
        return hazelcast.getMap("persons");
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringInDockerApplication.class, args);
    }
}
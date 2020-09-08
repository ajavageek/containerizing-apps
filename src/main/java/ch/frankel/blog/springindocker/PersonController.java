package ch.frankel.blog.springindocker;

import com.hazelcast.map.IMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;
import java.util.stream.Collectors;

@RestController
public class PersonController {

    private final IMap<String, Long> greetings;

    public PersonController(IMap<String, Long> greetings) {
        this.greetings = greetings;
    }

    @PutMapping("/{who}")
    public Person store(@PathVariable String who) {
        var greeting = new Person(who, System.nanoTime());
        greetings.put(greeting.getWho(), greeting.getWhen());
        return greeting;
    }

    @GetMapping("/")
    public Collection<Person> list() {
        return greetings.entrySet()
                .stream()
                .map(entry -> new Person(entry.getKey(), entry.getValue()))
                .collect(Collectors.toList());
    }
}
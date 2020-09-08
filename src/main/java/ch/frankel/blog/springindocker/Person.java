package ch.frankel.blog.springindocker;

import java.io.Serializable;

public class Person implements Serializable {

    private final String who;
    private final Long when;

    public Person(String who, Long when) {
        this.when = when;
        this.who = who;
    }

    public Long getWhen() {
        return when;
    }

    public String getWho() {
        return who;
    }
}
package ch.frankel.blog.springindocker;

import java.io.Serializable;

public record Person(String who, Long when) implements Serializable {
}

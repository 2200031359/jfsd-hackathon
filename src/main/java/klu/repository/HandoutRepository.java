package klu.repository;

import klu.model.Handout;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HandoutRepository extends JpaRepository<Handout, Long> {
}

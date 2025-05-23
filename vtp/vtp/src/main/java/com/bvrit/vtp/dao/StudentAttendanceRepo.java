package com.bvrit.vtp.dao;


import com.bvrit.vtp.model.StudentAttendance;
import com.bvrit.vtp.dao.StudentAttendanceRepo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Optional;

import java.util.List;

@Repository
public interface StudentAttendanceRepo extends JpaRepository<StudentAttendance, Long> {
    Optional<StudentAttendance> findByEmailAndDateAndTime(String email, LocalDate date, LocalTime time);
}

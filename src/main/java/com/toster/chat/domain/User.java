package com.toster.chat.domain;


import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@NamedQueries({
        @NamedQuery(
                name = "findUserByEmail",
                query = "from User u where u.email = :email"
        )
})
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @Size(min = 2, max = 15, message =
            "First name must be between 2 and 15 characters long")
    @Pattern(regexp = "^[a-zA-Z]+$",
            message = "Invalid characters")
    private String firstName;

    @Size(max = 15, message =
            "Last name must be between 2 and 15 characters long")
    @Pattern(regexp = "^[a-zA-Z]+$",
            message = "Invalid characters")
    private String lastName;

    @Size(min = 5, max = 20,
            message = "The password must be at least 5 characters long")
    private String password;


    @Pattern(regexp = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",
            message = "Invalid email address")
    private String email;

    public User() {

    }

    public User(String firstName, String lastName,
                String email, String password) {
        this.id = null;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "firstName", nullable = false)
    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    @Column(name = "lastName", nullable = false)
    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "password", nullable = false)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @Column(name = "email", nullable = false)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

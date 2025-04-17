package org.example.cicdproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class cicd_controller {
    @GetMapping("/home")
    public String print_message(){
        return "Hello World";
    }
}

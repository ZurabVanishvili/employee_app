package com.example.demo.controller;

import java.util.List;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.EmployeeService;
import com.example.demo.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeService employeeService;
    @Autowired
    private UserRepository userRepository;

    public EmployeeController(EmployeeService theEmployeeService) {
        employeeService = theEmployeeService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/list")
    public String listEmployees(Model theModel) {

        List<Employee> theEmployees = employeeService.findAll();

        theModel.addAttribute("employees", theEmployees);

        return "list-employees";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {

        Employee theEmployee = new Employee();

        theModel.addAttribute("employee", theEmployee);

        return "employee-form";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("employeeId") int theId,
                                    Model theModel) {

        Employee theEmployee = employeeService.findById(theId);

        // set employee as a model attribute to pre-populate the form
        theModel.addAttribute("employee", theEmployee);

        return "employee-form";
    }


    @PostMapping("/save")
    public String saveEmployee(@ModelAttribute("employee") Employee theEmployee) {

        employeeService.save(theEmployee);

        return "redirect:/employees/list";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam("employeeId") int theId) {

        employeeService.deleteById(theId);

        return "redirect:/employees/list";

    }

    @PostMapping("/list")
    public String processLoginForm(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        User user = userRepository.findByUsername(username);
        model.addAttribute("log", false);

        if (user != null && user.getPassword().equals(password)) {
            List<Employee> theEmployees = employeeService.findAll();

            model.addAttribute("employees", theEmployees);

            session.setAttribute("loggedIn", true);

            model.addAttribute("log", true);

            return "list-employees";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "loginPage";
        }
    }

    @GetMapping("/search")
    public String searchEmployees(@RequestParam("first_name") String first_name, Model model) {
        List<Employee> employees = employeeService.findByName(first_name);
        model.addAttribute("employees", employees);
        return "list-employees";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        List<Employee> theEmployees = employeeService.findAll();

        session.setAttribute("loggedIn",false);
        model.addAttribute("employees", theEmployees);

        session.invalidate();
        return "list-employees";
    }


}


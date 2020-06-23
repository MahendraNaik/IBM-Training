package comm.example.controller;
import comm.example.model.Task;
import comm.example.service.TaskService;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import java.sql.Date;

import javax.validation.Valid;

@Controller
@RequestMapping("/task")
public class TaskController {
    private TaskService taskService;

    public TaskController(TaskService taskService) {

        this.taskService = taskService;
    }

    @RequestMapping("/listTask")
    public String listTask(Model model) {
        model.addAttribute("tasks", taskService.getTask());
        return "task-list";

    }

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
        dataBinder.registerCustomEditor(Date.class, stringTrimmerEditor);
        dataBinder.registerCustomEditor(Number.class, stringTrimmerEditor);

    }

    @RequestMapping("/showFormForAdd")
    public String showFormForAdd(Model model)
    {
        model.addAttribute("task",new Task());
        return "task-form";
    }

    @RequestMapping("/saveTask")
    public String saveCustomer(@Valid @ModelAttribute("task") Task task, BindingResult theBindingResult)
    {
        if (theBindingResult.hasErrors())
        {
            return "task-form";
        }
        else
        {
            taskService.createTask(task);
            return "redirect:/task/listTask";
        }
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("taskId") int theId, Model theModel) {

        Task theTask = taskService.getTask(theId);
        theModel.addAttribute("task", theTask);

        return "task-form";
    }

    @RequestMapping("/updateTask")
    public String updateCustomer(@ModelAttribute("task") Task task)
    {
        taskService.createTask(task);
        return "redirect:/task/listTask";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("taskId") int taskId)
    {
        taskService.deleteTask(taskId);
        return "redirect:/task/listTask";
    }
}

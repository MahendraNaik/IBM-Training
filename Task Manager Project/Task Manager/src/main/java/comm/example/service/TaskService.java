package comm.example.service;

import comm.example.model.Task;

import java.util.List;

public interface TaskService {
    public List<Task> getTask();
    public void createTask(Task task);
    public Task getTask(int taskId);
    public void deleteTask(int taskId);
}

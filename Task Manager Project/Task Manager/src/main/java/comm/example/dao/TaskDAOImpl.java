package comm.example.dao;

import comm.example.model.Task;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Repository("taskDAO")
public class TaskDAOImpl implements TaskDAO {
    private final EntityManager entityManager;

    @Autowired
    public TaskDAOImpl(EntityManager entityManager) {

        this.entityManager = entityManager;

    }

    @Override
    @Transactional
    public List<Task> getTask() {
        Query query = entityManager.createQuery(" from Task");
        return query.getResultList();
    }

    @Override
    @Transactional
    public void createTask(Task task) {
        Session session = entityManager.unwrap(org.hibernate.Session.class);
        session.saveOrUpdate(task);
    }

    @Override
    @Transactional
    public Task getTask(int taskId) {
        return entityManager.find(Task.class, taskId);
    }

    @Override
    @Transactional
    public void deleteTask(int taskId) {
        entityManager.remove(getTask(taskId));
    }


}

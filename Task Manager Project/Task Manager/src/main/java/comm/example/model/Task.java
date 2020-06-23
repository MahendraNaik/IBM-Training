package comm.example.model;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Date;

@Data
@Entity
@Getter
@Setter
@Table(name = "task")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "task_id")
    private int taskId;

    @Column(name = "task_name")
    @NotNull(message="*Task Name Required ")
    private String taskName;

    @Column(name = "star_date")
    @NotNull(message="*Start Date Required ")
    private Date startDate;

    @Column(name = "end_date")
    @NotNull(message="*End Date Required ")
    private Date endDate;

    @Column(name = "task_priority")
    @NotNull(message="*Task Priority Required ")
    private int taskPriority;

    @Column(name = "task_status")
    @NotNull(message="*Task Status Required ")
    private String taskStatus;

}

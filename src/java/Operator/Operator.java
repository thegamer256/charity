
package Operator;

import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author LE ANH TUAN
 */

@Builder
@Getter
@Setter
@ToString
public class Operator {
    private int operatorId;
    private int programId;
    private String operatorDate;
    private String operatorDetailDes;
    private long actualExpense;
    private List<OperatorImage> activiesImgs;
    private List<OperatorImage> billImgs;

}

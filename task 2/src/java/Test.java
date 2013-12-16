
import package1.Worker;
import package1.WorkerManager;


public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		WorkerManager wm = new WorkerManager();
		wm.connectDB();
		Worker wk = wm.getWorkerById(205);
		System.out.println(wk.getSalary());
                Integer.parseInt("aaaaa");
		
	}

}

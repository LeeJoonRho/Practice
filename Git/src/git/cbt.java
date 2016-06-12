package git;


import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.JRadioButton;
import java.util.Timer;
import java.util.TimerTask;
import java.awt.Toolkit;
import java.awt.Dimension;

public class cbt extends JFrame implements ActionListener {

	static JFrame frm = new JFrame("CBT!");
	JRadioButton btn[] = new JRadioButton[4];
	//JRadioButton m_answer[] = new JRadioButton[btn.length];
	JButton move;
	JButton before;
	static JLabel Time_label = new JLabel();
	JLabel label[] = new JLabel[3];
	ButtonGroup group = new ButtonGroup();
	
	JDialog finish = new JDialog();
	JLabel Submit = new JLabel();
	JButton yes;
	JButton no;

	int i = 0, j = 0;
	int right = 0;

	static int time_count = 60; // ��
	static int secs = time_count;
	static int mins = secs / 60;

	String que[] = { "�ѱ��� â���Ͻź���?", "�����ذ� ���弱������ ������?", " 1+2 = ? " };
	String bwn[][] = { { "��������", "�������", "Ƽ��", "ȣ����" }, { "����Ÿ", "��õ��", "����õ", "���ѱ�" }, { "1", "5", "4", "3" } };
	int awn[] = { 2, 3, 4 };// ����
	int my_awn[] = new int[3]; // ���� �Է��� ��

	public cbt() {
		Dimension res = Toolkit.getDefaultToolkit().getScreenSize();
		frm.setSize(res.width, res.height);
		frm.setVisible(true);
		frm.setLayout(null);

		Button();
		Label();
		bn();
	}

	void Last() {	//���� Ȯ��â
		finish = new JDialog(frm, "����");
		finish.setBounds(700, 400, 300, 200);
		finish.setVisible(true);
		finish.setLayout(null);
		
		finish.add(Submit=new JLabel("�����Ͻðڽ��ϱ�?",JLabel.CENTER));
		Submit.setSize(300, 100);
		
		Submit_yes();
		Submit_no();
	}
	
	void Submit_yes() {	//yes ��ư
		finish.add(yes=new JButton("YES"));
		yes.setBounds(20, 100, 100, 50);
		yes.setVisible(true);
		yes.addActionListener(this);
	}
	
	void Submit_no() {	//no ��ư
		finish.add(no=new JButton("NO"));
		no.setBounds(160, 100, 100, 50);
		no.setVisible(true);
		no.addActionListener(this);
	}

	void bn() {
		frm.add(before = new JButton("<<"));
		before.setBounds(500, 600, 100, 50);
		before.addActionListener(this);

		frm.add(move = new JButton(">>"));
		move.setBounds(650, 600, 100, 50);
		move.addActionListener(this);

	}

	void Label() {

		frm.add(label[j] = new JLabel(que[j], JLabel.CENTER));

		label[j].setBounds(75, 30, 950, 250);
		label[j].setOpaque(true); // Opaque���� true�� �̸� ������ �־�� ������ ����ȴ�.
		label[j].setBackground(Color.pink);

		Font Que = new Font("���� ���", Font.PLAIN, 30); // ��Ʈ ����
		label[j].setFont(Que);

	}

	void Button() {

		for (i = 0; i < 4; i++) {
			frm.add(btn[i] = new JRadioButton(bwn[j][i]));
			group.add(btn[i]);
			btn[i].addActionListener(this);
			btn[i].setBounds(70, 300 + (100 * i), 100, 50);

			Font Btn = new Font("���� ���", Font.PLAIN, 16); // ��Ʈ ����

			btn[i].setFont(Btn);
		}
	}

	void finish() {
		for (i = 0; i < 3; i++) {
			if (my_awn[i] == awn[i]) // �Է��� ��� ������ ��
				right++;
		}
		System.out.println(right + "�� �¾ҽ��ϴ�."); // ���� ���� ���

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		System.exit(1);
	}

	void Question() {
		Button();
		Label();
	}

	// ����!!
	public static void main(String[] args) {
		Timer timer = new Timer(); // Ÿ�̸�
		timer.schedule(new WorkTask(), 1000, 1000); // 1�� �� ���� ����
		new cbt();
	}

	public static class WorkTask extends TimerTask {
		@Override
		public void run() {
			time_count--; // 5�п��� 1�ʾ� ����
			secs = time_count; // �� ������ ���� �ð��� ����
			mins = secs / 60; // �� ������ 60���� ���� ���� ����
			secs = secs % 60; // �ʿ��� 60���� ���� �� �������� ����

			frm.add(Time_label = new JLabel(mins + " : " + secs, JLabel.CENTER)); // Ÿ�̸�
																					// ��
																					// ����,
																					// ���
																					// ����
			if (mins == 0 && secs == 0) {
				cbt cbt = new cbt();

				cbt.finish();
			}

			Time_label.setBounds(1050, 30, 300, 200);
			Time_label.setOpaque(true);
			Time_label.setBackground(Color.black);

			Font timer = new Font("���� ���", Font.PLAIN, 20); // ��Ʈ ����
			Time_label.setFont(timer);

			Time_label.setForeground(Color.WHITE);
		}
	}

	public void actionPerformed(ActionEvent e) {

		if (j == 0) {
			for (i = 0; i < 4; i++) {
				if (e.getSource().equals(btn[i]))
					my_awn[j] = i + 1;
			}
		}

		else if (j == 1) {
			for (i = 0; i < 4; i++) {
				if (e.getSource().equals(btn[i]))
					my_awn[j] = i + 1;
			}
		}

		else if (j == 2) {
			for (i = 0; i < 4; i++) {
				if (e.getSource().equals(btn[i]))
					my_awn[j] = i + 1;
			}
		}

		if (e.getSource().equals(before)) {
			for (i = 0; i < 4; i++) {
				btn[i].setVisible(false); // ��ư ������ �ʰ� �ϱ�
			}
			label[j].setVisible(false); // �����ѱ��

			j--;

			if (j == -1)
				j = 0;

			Question();

		}

		if (e.getSource().equals(move)) {
			for (i = 0; i < 4; i++) {
				btn[i].setVisible(false); // ��ư ������ �ʰ� �ϱ�
			}
			label[j].setVisible(false);

			j++;

			if (j == 3) {
				Last();
				j--;
			}
			// finish(); ������ ��ư ���� �����Դϴ�.
			// Ÿ�̸� ������ ������ �޼ҵ�
			Question();
		}
		
		if(e.getSource().equals(yes))
		{
			finish();	//yes ��ư Ŭ���� ����
		}
		
		else if(e.getSource().equals(no))
		{
			finish.setVisible(false);	//no ��ư Ŭ���� Ȯ��â �ݱ�
		}
	}
}
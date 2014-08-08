import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Menu extends JFrame implements ActionListener {
	String launch_date = null;
	String train_no = null;
	String get_on_station = null;
	String get_off_station = null;
	String seat_type = null;	
	String name = null;
	String id = null;
	
	JPanel main_menu = new JPanel();
		JButton main_menu_buy = new JButton("��ƱԤ��");
		JButton main_menu_rearrange = new JButton("��Ʊ��ǩ/��Ʊ");
		JButton main_menu_about = new JButton("����");
		JButton main_menu_quit = new JButton("�˳�");
		JLabel main_menu_blank1 = new JLabel(" ��������Ʊϵͳ ",SwingConstants.CENTER);
		JLabel main_menu_blank2 = new JLabel("               ");
		JLabel main_menu_blank3 = new JLabel("               ");
	
	JPanel buy_train_input = new JPanel();
		JLabel buy_train_input_l1 = new JLabel("�˳�����",SwingConstants.RIGHT);
		JTextField buy_train_input_t1 = new JTextField(launch_date,9);
		
		JLabel buy_train_input_l2 = new JLabel("����",SwingConstants.RIGHT);
		JTextField buy_train_input_t2 = new JTextField(train_no,5);
		
		JLabel buy_train_input_l3 = new JLabel("��",SwingConstants.RIGHT);
		JTextField buy_train_input_t3 = new JTextField(get_on_station,9);
		
		JLabel buy_train_input_l4 = new JLabel("��",SwingConstants.RIGHT);
		JTextField buy_train_input_t4 = new JTextField(get_off_station,9);
		
		JLabel buy_train_input_l5 = new JLabel("ϯ��",SwingConstants.RIGHT);
		JTextField buy_train_input_t5 = new JTextField(seat_type,8);
		JLabel buy_blank1 = new JLabel("                                                                          ");
		JLabel buy_blank2 = new JLabel("                                                                         ");
		JLabel buy_blank3 = new JLabel("                                                                        ");
		
		JButton buy_train_input_b1 = new JButton("ȷ��");
		JButton buy_train_input_b2 = new JButton("���");
		JButton buy_train_input_b3 = new JButton("����");
	
	JPanel buy_info_input = new JPanel();
		JLabel buy_info_input_l1 = new JLabel("�˳�����",SwingConstants.RIGHT);
		JTextField buy_info_input_t1 = new JTextField(launch_date,9);
		
		JLabel buy_info_input_l2 = new JLabel("����",SwingConstants.RIGHT);
		JTextField buy_info_input_t2 = new JTextField(train_no,5);
		
		JLabel buy_info_input_l3 = new JLabel("��",SwingConstants.RIGHT);
		JTextField buy_info_input_t3 = new JTextField(get_on_station,9);
		
		JLabel buy_info_input_l4 = new JLabel("��",SwingConstants.RIGHT);
		JTextField buy_info_input_t4 = new JTextField(get_off_station,9);
		
		JLabel buy_info_input_l5 = new JLabel("ϯ��",SwingConstants.RIGHT);
		JTextField buy_info_input_t5 = new JTextField(seat_type,8);
		
		JLabel buy_info_input_l6 = new JLabel("����",SwingConstants.RIGHT);
		JTextField buy_info_input_t6 = new JTextField(8);
		
		JLabel buy_info_input_l7 = new JLabel("���֤��",SwingConstants.RIGHT);
		JTextField buy_info_input_t7 = new JTextField(18);
		
		JButton buy_info_input_b1 = new JButton("�ύ");
		JButton buy_info_input_b2 = new JButton("���");
		JButton buy_info_input_b3 = new JButton("����");
	
	JPanel buy_success_notice = new JPanel();
		JLabel buy_success_notice_l = new JLabel("��Ʊ�ɹ�");
		JTextArea buy_success_notice_t = new JTextArea(10,22);
		JButton buy_success_notice_b = new JButton("��ӡ");
	
	JPanel buy_failed_notice = new JPanel();
		JLabel buy_failed_notice_l = new JLabel("��Ʊʧ��");
		JTextArea buy_failed_notice_t = new JTextArea("\n     ��ʾ��\n\n          �������벻������û�з����������г�\n          ����������",10,25);
		JButton buy_failed_notice_b1 = new JButton("����");
		JButton buy_failed_notice_b2 = new JButton("����");
	
	JPanel about = new JPanel();
		JTextArea about_a = new JTextArea("\n\n\n                   2011�� ����� һ�� �����\n         2012-2013ѧ�� �ڶ�ѧ�� Java�γ����",10,25);
		JLabel about_l1 = new JLabel("��Ȩ��Ϣ");
		JLabel about_l2 = new JLabel("��Ȩ����");
		JLabel about_l3 = new JLabel("All Rights Reserved");
		JButton about_b = new JButton("����");
	
	public Menu() {
		setSize(275,300);
		setLocation(500,300);
		setTitle("��������Ʊϵͳ");
		setVisible(true);
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		main_menu_buy.addActionListener(this);
		main_menu_rearrange.addActionListener(this);
		main_menu_about.addActionListener(this);
		main_menu_quit.addActionListener(this);
		
		main_menu_buy.setToolTipText("����һ�ų�Ʊ");
		main_menu_rearrange.setToolTipText("��ǩ�˵��������ĳ�Ʊ");
		main_menu_about.setToolTipText("�������");
		main_menu_quit.setToolTipText("�˳�����");
		
		main_menu.setLayout(new GridLayout(7,3));
		
		JPanel main_menu_buy_p = new JPanel();
		JPanel main_menu_rearrange_p = new JPanel();
		JPanel main_menu_about_p = new JPanel();
		JPanel main_menu_quit_p = new JPanel();	
		
		main_menu_buy_p.add(main_menu_buy);
		main_menu_rearrange_p.add(main_menu_rearrange);
		main_menu_about_p.add(main_menu_about);
		main_menu_quit_p.add(main_menu_quit,true);
		
		main_menu.add(main_menu_blank1);
		main_menu.add(main_menu_buy_p);
		main_menu.add(main_menu_rearrange_p);
		main_menu.add(main_menu_about_p);
		main_menu.add(main_menu_blank2);
		main_menu.add(main_menu_blank3);
		main_menu.add(main_menu_quit_p);
		add(main_menu);
		
		buy_train_input_b1.addActionListener(this);
		buy_train_input_b2.addActionListener(this);
		buy_train_input_b3.addActionListener(this);
		
		buy_train_input_b1.setToolTipText("ȷ���г���Ϣ");
		buy_train_input_b2.setToolTipText("����������Ϣ");
		buy_train_input_b3.setToolTipText("�������˵�");
		
	//	buy_train_input.setLayout(new GridLayout(5,1));
		buy_train_input.add(buy_train_input_l1);
		buy_train_input_l1.setToolTipText("����8λ�˳����ڣ��磺20130808");
		buy_train_input.add(buy_train_input_t1);
		buy_train_input_t1.setToolTipText("����8λ�˳����ڣ��磺20130808");
		buy_train_input.add(buy_train_input_l2);
		buy_train_input_l2.setToolTipText("����5λ���³��α�ţ��磺C2009��D5107��T8��K689");
		buy_train_input.add(buy_train_input_t2);
		buy_train_input_t2.setToolTipText("����5λ���³��α�ţ��磺C2009��D5107��T8��K689");
		buy_train_input.add(buy_train_input_l3);
		buy_train_input_l3.setToolTipText("����˳�վ���磺���챱");
		buy_train_input.add(buy_train_input_t3);
		buy_train_input_t3.setToolTipText("����˳�վ���磺���챱");
		buy_train_input.add(buy_train_input_l4);
		buy_train_input_l4.setToolTipText("�����³�վ���磺�ɶ���");
		buy_train_input.add(buy_train_input_t4);
		buy_train_input_t4.setToolTipText("�����³�վ���磺�ɶ���");
		buy_train_input.add(buy_train_input_l5);
		buy_train_input_l5.setToolTipText("����ϯ���磺�����������ԡ�Ӳ�ԡ�Ӳ��");
		buy_train_input.add(buy_train_input_t5);
		buy_train_input_t5.setToolTipText("����ϯ���磺�����������ԡ�Ӳ�ԡ�Ӳ��");
		buy_train_input.add(buy_blank1);
		buy_train_input.add(buy_blank2);
		buy_train_input.add(buy_blank3);
		buy_train_input.add(buy_train_input_b1);
		buy_train_input.add(buy_train_input_b2);
		buy_train_input.add(buy_train_input_b3);
		
		buy_info_input_b1.addActionListener(this);
		buy_info_input_b2.addActionListener(this);
		buy_info_input_b3.addActionListener(this);
		buy_info_input.add(buy_info_input_l1);
		buy_info_input.add(buy_info_input_t1);
		buy_info_input_t1.setEnabled(false);
		buy_info_input.add(buy_info_input_l2);
		buy_info_input.add(buy_info_input_t2);
		buy_info_input_t2.setEnabled(false);
		buy_info_input.add(buy_info_input_l3);
		buy_info_input.add(buy_info_input_t3);
		buy_info_input_t3.setEnabled(false);
		buy_info_input.add(buy_info_input_l4);
		buy_info_input.add(buy_info_input_t4);
		buy_info_input_t4.setEnabled(false);
		buy_info_input.add(buy_info_input_l5);
		buy_info_input.add(buy_info_input_t5);
		buy_info_input_t5.setEnabled(false);
		buy_info_input.add(buy_info_input_l6);
		buy_info_input.add(buy_info_input_t6);
		buy_info_input_t6.setToolTipText("�����ÿ��������磺���");
		buy_info_input.add(buy_info_input_l7);
		buy_info_input.add(buy_info_input_t7);
		buy_info_input_t7.setToolTipText("����18λ���֤��");
		buy_info_input.add(buy_info_input_b1);
		buy_info_input.add(buy_info_input_b2);
		buy_info_input.add(buy_info_input_b3);
		
		buy_success_notice_b.addActionListener(this);
		buy_success_notice.add(buy_success_notice_l);
		
		buy_success_notice.add(buy_success_notice_t);
		buy_success_notice_t.setEnabled(false);
		buy_success_notice.add(buy_success_notice_b);
		
		buy_failed_notice_b1.addActionListener(this);
		buy_failed_notice_b2.addActionListener(this);
		buy_failed_notice.add(buy_failed_notice_l);
		buy_failed_notice.add(buy_failed_notice_t);
		buy_failed_notice.add(buy_failed_notice_b1);
		buy_failed_notice.add(buy_failed_notice_b1);
		
		about_b.addActionListener(this);
		about.add(about_l1);
		about.add(about_a);
		about_a.setEditable(false);
		about.add(about_l2);
		about.add(about_l3);
		about.add(about_b);
	}
	
	public void actionPerformed(ActionEvent e) {
		if("��ƱԤ��".equals(e.getActionCommand())) {
			main_menu.setVisible(false);
			buy_train_input.setVisible(true);
			add(buy_train_input);
			remove(main_menu);
		}
		else if("��Ʊ��ǩ/��Ʊ".equals(e.getActionCommand())) {
			
		}
		else if("����".equals(e.getActionCommand())) {
			main_menu.setVisible(false);
			about.setVisible(true);
			add(about);
			remove(main_menu);
		}
		else if("�˳�".equals(e.getActionCommand())) {
			
		}
		else if("ȷ��".equals(e.getActionCommand())) {
			launch_date = buy_train_input_t1.getText();
			train_no = buy_train_input_t2.getText();
			get_on_station = buy_train_input_t3.getText();
			get_off_station = buy_train_input_t4.getText();
			seat_type = buy_train_input_t5.getText();				
			
			buy_train_input.setVisible(false);
			if( launch_date.length()==0 || train_no.length()==0 || get_on_station.length()==0 || get_off_station.length()==0 || seat_type.length()==0 ) {
				buy_failed_notice.setVisible(true);
				add(buy_failed_notice);
			}
			else {
				buy_info_input_t1.setText(launch_date);
				buy_info_input_t2.setText(train_no);
				buy_info_input_t3.setText(get_on_station);
				buy_info_input_t4.setText(get_off_station);
				buy_info_input_t5.setText(seat_type);
				buy_info_input.setVisible(true);
				add(buy_info_input);
			}
			remove(buy_train_input);
		}
		else if("����".equals(e.getActionCommand())) {
			buy_train_input.setVisible(false);
			buy_failed_notice.setVisible(false);
			about.setVisible(false);
			main_menu.setVisible(true);
			add(main_menu);
			remove(buy_train_input);
			remove(buy_failed_notice);
			remove(about);
		}
		else if("�ύ".equals(e.getActionCommand())) {
			name = buy_info_input_t6.getText();
			id = buy_info_input_t7.getText();			
			buy_info_input.setVisible(false);
			if( name.length()==0 || id.length()==0 ) {
				buy_failed_notice.setVisible(true);
				add(buy_failed_notice);
			}
			else {
				buy_success_notice_t.setText("\n�˳����ڣ�"+launch_date+"\n���Σ�"+train_no+"\n�� "+get_on_station+" �� "+get_off_station+"\nϯ��"+seat_type+"\n�˿�������"+name+"\n���֤�ţ�"+id);
				
				buy_success_notice.setVisible(true);
				add(buy_success_notice);
			}
			remove(buy_info_input);
		}
		else if("����".equals(e.getActionCommand())) {
			buy_info_input.setVisible(false);
			buy_failed_notice.setVisible(false);
			buy_train_input.setVisible(true);
			add(buy_train_input);
			remove(buy_info_input);
			remove(buy_failed_notice);
		}
		else if("��ӡ".equals(e.getActionCommand())) {
			buy_train_input_t1.setText(null);
			buy_train_input_t2.setText(null);
			buy_train_input_t3.setText(null);
			buy_train_input_t4.setText(null);
			buy_train_input_t5.setText(null);
			
			buy_info_input_t1.setText(null);
			buy_info_input_t2.setText(null);
			buy_info_input_t3.setText(null);
			buy_info_input_t4.setText(null);
			buy_info_input_t5.setText(null);
			buy_info_input_t6.setText(null);
			buy_info_input_t7.setText(null);
			
			buy_success_notice_t.setText(null);
			
			buy_success_notice.setVisible(false);
			main_menu.setVisible(true);
			add(main_menu);
			remove(buy_success_notice);
		}
		else if("���".equals(e.getActionCommand())) {
			
			buy_train_input_t1.setText(null);
			buy_train_input_t2.setText(null);
			buy_train_input_t3.setText(null);
			buy_train_input_t4.setText(null);
			buy_train_input_t5.setText(null);
			
			buy_info_input_t1.setText(null);
			buy_info_input_t2.setText(null);
			buy_info_input_t3.setText(null);
			buy_info_input_t4.setText(null);
			buy_info_input_t5.setText(null);
			buy_info_input_t6.setText(null);
			buy_info_input_t7.setText(null);
			
			buy_success_notice_t.setText(null);
		}
	}

	public static void main(String[] args) {
		Menu menu = new Menu();
	}

}

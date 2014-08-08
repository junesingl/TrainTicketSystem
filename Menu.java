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
		JButton main_menu_buy = new JButton("车票预定");
		JButton main_menu_rearrange = new JButton("车票改签/退票");
		JButton main_menu_about = new JButton("关于");
		JButton main_menu_quit = new JButton("退出");
		JLabel main_menu_blank1 = new JLabel(" 火车自助订票系统 ",SwingConstants.CENTER);
		JLabel main_menu_blank2 = new JLabel("               ");
		JLabel main_menu_blank3 = new JLabel("               ");
	
	JPanel buy_train_input = new JPanel();
		JLabel buy_train_input_l1 = new JLabel("乘车日期",SwingConstants.RIGHT);
		JTextField buy_train_input_t1 = new JTextField(launch_date,9);
		
		JLabel buy_train_input_l2 = new JLabel("车次",SwingConstants.RIGHT);
		JTextField buy_train_input_t2 = new JTextField(train_no,5);
		
		JLabel buy_train_input_l3 = new JLabel("从",SwingConstants.RIGHT);
		JTextField buy_train_input_t3 = new JTextField(get_on_station,9);
		
		JLabel buy_train_input_l4 = new JLabel("到",SwingConstants.RIGHT);
		JTextField buy_train_input_t4 = new JTextField(get_off_station,9);
		
		JLabel buy_train_input_l5 = new JLabel("席别",SwingConstants.RIGHT);
		JTextField buy_train_input_t5 = new JTextField(seat_type,8);
		JLabel buy_blank1 = new JLabel("                                                                          ");
		JLabel buy_blank2 = new JLabel("                                                                         ");
		JLabel buy_blank3 = new JLabel("                                                                        ");
		
		JButton buy_train_input_b1 = new JButton("确定");
		JButton buy_train_input_b2 = new JButton("清空");
		JButton buy_train_input_b3 = new JButton("返回");
	
	JPanel buy_info_input = new JPanel();
		JLabel buy_info_input_l1 = new JLabel("乘车日期",SwingConstants.RIGHT);
		JTextField buy_info_input_t1 = new JTextField(launch_date,9);
		
		JLabel buy_info_input_l2 = new JLabel("车次",SwingConstants.RIGHT);
		JTextField buy_info_input_t2 = new JTextField(train_no,5);
		
		JLabel buy_info_input_l3 = new JLabel("从",SwingConstants.RIGHT);
		JTextField buy_info_input_t3 = new JTextField(get_on_station,9);
		
		JLabel buy_info_input_l4 = new JLabel("到",SwingConstants.RIGHT);
		JTextField buy_info_input_t4 = new JTextField(get_off_station,9);
		
		JLabel buy_info_input_l5 = new JLabel("席别",SwingConstants.RIGHT);
		JTextField buy_info_input_t5 = new JTextField(seat_type,8);
		
		JLabel buy_info_input_l6 = new JLabel("姓名",SwingConstants.RIGHT);
		JTextField buy_info_input_t6 = new JTextField(8);
		
		JLabel buy_info_input_l7 = new JLabel("身份证号",SwingConstants.RIGHT);
		JTextField buy_info_input_t7 = new JTextField(18);
		
		JButton buy_info_input_b1 = new JButton("提交");
		JButton buy_info_input_b2 = new JButton("清空");
		JButton buy_info_input_b3 = new JButton("后退");
	
	JPanel buy_success_notice = new JPanel();
		JLabel buy_success_notice_l = new JLabel("订票成功");
		JTextArea buy_success_notice_t = new JTextArea(10,22);
		JButton buy_success_notice_b = new JButton("打印");
	
	JPanel buy_failed_notice = new JPanel();
		JLabel buy_failed_notice_l = new JLabel("订票失败");
		JTextArea buy_failed_notice_t = new JTextArea("\n     提示：\n\n          您的输入不完整或没有符合条件的列车\n          请重新输入",10,25);
		JButton buy_failed_notice_b1 = new JButton("后退");
		JButton buy_failed_notice_b2 = new JButton("返回");
	
	JPanel about = new JPanel();
		JTextArea about_a = new JTextArea("\n\n\n                   2011级 计算机 一班 李君行\n         2012-2013学年 第二学期 Java课程设计",10,25);
		JLabel about_l1 = new JLabel("版权信息");
		JLabel about_l2 = new JLabel("版权所有");
		JLabel about_l3 = new JLabel("All Rights Reserved");
		JButton about_b = new JButton("返回");
	
	public Menu() {
		setSize(275,300);
		setLocation(500,300);
		setTitle("火车自助订票系统");
		setVisible(true);
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		main_menu_buy.addActionListener(this);
		main_menu_rearrange.addActionListener(this);
		main_menu_about.addActionListener(this);
		main_menu_quit.addActionListener(this);
		
		main_menu_buy.setToolTipText("购买一张车票");
		main_menu_rearrange.setToolTipText("改签退掉您订购的车票");
		main_menu_about.setToolTipText("关于软件");
		main_menu_quit.setToolTipText("退出程序");
		
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
		
		buy_train_input_b1.setToolTipText("确认列车信息");
		buy_train_input_b2.setToolTipText("清空输入的信息");
		buy_train_input_b3.setToolTipText("返回主菜单");
		
	//	buy_train_input.setLayout(new GridLayout(5,1));
		buy_train_input.add(buy_train_input_l1);
		buy_train_input_l1.setToolTipText("输入8位乘车日期，如：20130808");
		buy_train_input.add(buy_train_input_t1);
		buy_train_input_t1.setToolTipText("输入8位乘车日期，如：20130808");
		buy_train_input.add(buy_train_input_l2);
		buy_train_input_l2.setToolTipText("输入5位以下车次编号，如：C2009、D5107、T8、K689");
		buy_train_input.add(buy_train_input_t2);
		buy_train_input_t2.setToolTipText("输入5位以下车次编号，如：C2009、D5107、T8、K689");
		buy_train_input.add(buy_train_input_l3);
		buy_train_input_l3.setToolTipText("输入乘车站，如：重庆北");
		buy_train_input.add(buy_train_input_t3);
		buy_train_input_t3.setToolTipText("输入乘车站，如：重庆北");
		buy_train_input.add(buy_train_input_l4);
		buy_train_input_l4.setToolTipText("输入下车站，如：成都东");
		buy_train_input.add(buy_train_input_t4);
		buy_train_input_t4.setToolTipText("输入下车站，如：成都东");
		buy_train_input.add(buy_train_input_l5);
		buy_train_input_l5.setToolTipText("输入席别，如：二等座、软卧、硬卧、硬座");
		buy_train_input.add(buy_train_input_t5);
		buy_train_input_t5.setToolTipText("输入席别，如：二等座、软卧、硬卧、硬座");
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
		buy_info_input_t6.setToolTipText("输入旅客姓名，如：李开复");
		buy_info_input.add(buy_info_input_l7);
		buy_info_input.add(buy_info_input_t7);
		buy_info_input_t7.setToolTipText("输入18位身份证号");
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
		if("车票预定".equals(e.getActionCommand())) {
			main_menu.setVisible(false);
			buy_train_input.setVisible(true);
			add(buy_train_input);
			remove(main_menu);
		}
		else if("车票改签/退票".equals(e.getActionCommand())) {
			
		}
		else if("关于".equals(e.getActionCommand())) {
			main_menu.setVisible(false);
			about.setVisible(true);
			add(about);
			remove(main_menu);
		}
		else if("退出".equals(e.getActionCommand())) {
			
		}
		else if("确定".equals(e.getActionCommand())) {
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
		else if("返回".equals(e.getActionCommand())) {
			buy_train_input.setVisible(false);
			buy_failed_notice.setVisible(false);
			about.setVisible(false);
			main_menu.setVisible(true);
			add(main_menu);
			remove(buy_train_input);
			remove(buy_failed_notice);
			remove(about);
		}
		else if("提交".equals(e.getActionCommand())) {
			name = buy_info_input_t6.getText();
			id = buy_info_input_t7.getText();			
			buy_info_input.setVisible(false);
			if( name.length()==0 || id.length()==0 ) {
				buy_failed_notice.setVisible(true);
				add(buy_failed_notice);
			}
			else {
				buy_success_notice_t.setText("\n乘车日期："+launch_date+"\n车次："+train_no+"\n从 "+get_on_station+" 到 "+get_off_station+"\n席别："+seat_type+"\n乘客姓名："+name+"\n身份证号："+id);
				
				buy_success_notice.setVisible(true);
				add(buy_success_notice);
			}
			remove(buy_info_input);
		}
		else if("后退".equals(e.getActionCommand())) {
			buy_info_input.setVisible(false);
			buy_failed_notice.setVisible(false);
			buy_train_input.setVisible(true);
			add(buy_train_input);
			remove(buy_info_input);
			remove(buy_failed_notice);
		}
		else if("打印".equals(e.getActionCommand())) {
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
		else if("清空".equals(e.getActionCommand())) {
			
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

package cn.itcast.image;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.junit.Test;

/**
 * 动态生成图片
 * @author cxf
 *
 */
public class Demo {
	@Test
	public void fun1() throws FileNotFoundException, IOException {
		/*
		 * 1. 创建图片缓冲区
		 * 2. 设置其宽高
		 * 3. 得到这个图片的绘制环境（得到画笔）
		 * 4. 保存起来
		 */
		BufferedImage bi = new BufferedImage(70, 35, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = (Graphics2D)bi.getGraphics();//得到绘制环境
		g.setColor(Color.WHITE);//把环境设置为白色
		g.fillRect(0, 0, 70, 35);//填充矩形！填充矩形，从0,0点开始，宽70，高35，即整个图片，即为图片设置背景色
		g.setColor(Color.RED);//把环境设置为红色
		g.drawString("Hello", 2, 35-2);//向图片上写入字符串，其中2,2表示x,y轴的坐标
		
		ImageIO.write(bi, "JPEG", new FileOutputStream("F:/xxx.jpg"));
	}
	
	@Test
	public void fun2() throws FileNotFoundException, IOException {
		VerifyCode vc = new VerifyCode();
		BufferedImage bi = vc.getImage();
		VerifyCode.output(bi, new FileOutputStream("F:/xxx.jpg"));
		
		System.out.println(vc.getText());
	}
}

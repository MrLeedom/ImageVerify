package cn.itcast.uuid;

import java.util.UUID;

import org.junit.Test;

import cn.itcast.commons.CommonUtils;

public class UUIDTest {
	@Test
	public void fun1() {
		UUID uuid = UUID.randomUUID();
		String string = uuid.toString();
		string = string.replace("-", "");
		string = string.toUpperCase();
		System.out.println(string);
		
		System.out.println(CommonUtils.uuid());
	}
}

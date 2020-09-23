package test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.javalec.spring_gejo_board.dto.JoinDto;

public class JoinDtoTest {

	@Test
	public void DB에저장한아이디값이일치하는지() {
		final JoinDto memberVo = new JoinDto();
			memberVo.setMemId("muhaha");
		
		assertEquals("muhaha", memberVo.getMemId());
	}
	
	@Test
	public void DB에저장한이름값이일치하는지() {
		final JoinDto memberVo = new JoinDto();
		memberVo.setMemName("박사장");
	
	assertEquals("박사장", memberVo.getMemName());
	}

}

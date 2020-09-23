package test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.javalec.spring_gejo_board.HomeController;








 public class ControllerTest {
  
  @Autowired private MockMvc mockMvc;
  
  @Before public void seUp() { this.mockMvc =
  MockMvcBuilders.standaloneSetup(new
  HomeController()).setViewResolvers(viewResolver()).build(); }
  
  private ViewResolver viewResolver() { InternalResourceViewResolver
  viewResolver = new InternalResourceViewResolver();
  viewResolver.setViewClass(JstlView.class);
  viewResolver.setPrefix("/WEB-INF/views/"); viewResolver.setSuffix(".jsp");
  return viewResolver; }
  
  
  @Test public void homeTest() throws Exception { mockMvc.perform(get("/home") .accept(MediaType.APPLICATION_JSON))
  .andExpect(status().isOk()) .andExpect(model().errorCount(2))
  .andExpect(model().attributeHasFieldErrors("locale")); } }
 

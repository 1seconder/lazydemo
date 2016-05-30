/**
 * @Project: communityFocus
 * @FilePath: com.newenv.communityFocus.poioutput.PoiStreamingOutput.java
 * @Description: PoiStreamingOutput
 * @author: mingjie.lu
 * @date: 2016年4月27日 下午5:33:44
 */
package com.newenv.communityFocus.poioutput;

import java.io.IOException;
import java.io.OutputStream;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.StreamingOutput;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @ClassName: PoiStreamingOutput
 * @Description: PoiStreamingOutput
 * @author: mingjie.lu
 * @date: 2016年4月27日 下午5:33:44
 */
public class PoiStreamingOutput implements StreamingOutput {
	private HSSFWorkbook hssfWorkbook;

	/**
	 * <p>
	 * Title: PoiStreamingOutput
	 * </p>
	 * <p>
	 * Description: PoiStreamingOutput
	 * </p>
	 * 
	 * @param hssfWorkbook
	 */
	public PoiStreamingOutput(HSSFWorkbook hssfWorkbook) {
		this.hssfWorkbook = hssfWorkbook;
	}

	/*
	 * (非 Javadoc) <p>Title: write</p> <p>Description: write</p>
	 * 
	 * @param output
	 * 
	 * @throws IOException
	 * 
	 * @throws WebApplicationException
	 * 
	 * @see javax.ws.rs.core.StreamingOutput#write(java.io.OutputStream)
	 */
	@Override
	public void write(OutputStream output) throws IOException, WebApplicationException {
		if (hssfWorkbook != null) {
			hssfWorkbook.write(output);
		}
	}

}

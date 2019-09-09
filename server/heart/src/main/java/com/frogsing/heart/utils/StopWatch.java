package com.frogsing.heart.utils;

/**
 * 重做一个毫秒级的简单StopWatch轮子。
 * 
 * @frogsing van
 */
public class StopWatch {
	private long startTime;

	public StopWatch() {
		startTime = System.currentTimeMillis();
	}

	public long getMillis() {
		return System.currentTimeMillis() - startTime;
	}

	public void reset() {
		startTime = System.currentTimeMillis();
	}
}

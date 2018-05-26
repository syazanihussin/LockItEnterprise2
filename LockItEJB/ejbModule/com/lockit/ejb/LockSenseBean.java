package com.lockit.ejb;

import java.text.SimpleDateFormat;
import java.util.Date; 
import java.util.List;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.lockit.ejb.dao.local.LockSenseBeanLocal;
import com.lockit.ejb.dao.local.SensorDataBeanLocal;
import com.lockit.ejb.dao.remote.LockSenseBeanRemote;
import com.lockit.ejb.logic.local.LockSenseLogicLocal;
import com.lockit.ejb.logic.remote.LockSenseLogicRemote;
import com.lockit.entity.LockSense;
import com.lockit.entity.SensorData;


@Stateless(mappedName="LockSenseBean")
@LocalBean
public class LockSenseBean implements LockSenseBeanRemote, LockSenseBeanLocal, LockSenseLogicLocal, LockSenseLogicRemote {

	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("LockItORM");
	EntityManager entityManager = emf.createEntityManager();
	
	
	
	public LockSenseBean() {
		
	}
	
	
	@Override
	public void insertLockSense(LockSense lockSense) {
		entityManager.getTransaction().begin();
		entityManager.persist(lockSense); 
		entityManager.getTransaction().commit();
	}
	
	
	@Override
	public LockSense getLockSenseById(int id) {
		return (LockSense) entityManager.find(LockSense.class, id);
    }

    
	@Override
	@SuppressWarnings("unchecked")
	public List<LockSense> getAllLockSenses() {
		return entityManager.createQuery("From LockSense").getResultList();
    }

 
	@Override
    public void updateLockSense(LockSense lockSense) {
		entityManager.getTransaction().begin();
		entityManager.merge(lockSense); 
		entityManager.getTransaction().commit();
    }
	
	
	@Override
	public void deleteLockSense(int id) {
		LockSense lockSense = (LockSense) entityManager.find(LockSense.class, id);
		entityManager.getTransaction().begin();
		entityManager.remove(lockSense); 
		entityManager.getTransaction().commit();
    }
    
	
	@Override
	public void deleteAllLockSenses() {
		entityManager.getTransaction().begin();
		entityManager.createQuery("DELETE * From LockSense").executeUpdate();
		entityManager.getTransaction().commit();
    }
	
	List <LockSense> a = getAllLockSenses();
	
	SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");  
    Date date = new Date();  
    String df = formatter.format(date);  
    int CurrentTimestamp = Integer.parseInt(df);
	
	@Override
	public boolean checkLockSenseStatus() {
		SensorData SD = null;
		for(LockSense LS : a) {
			int last = LS.getSensorData().size() -1;
			SensorDataBeanLocal b = new SensorDataBean();
			SD = b.getSensorDataById(last);
		}
		if(CurrentTimestamp - SD.getDataTimestamp() > 100) {
			return true;
		}else
		return false;
		
	}
	
	@Override
	public int calculateTotalLockSense() {		
		return getAllLockSenses().size();		
	}

}

package com.frogsing.heart.jpa;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.core.RepositoryInformation;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.data.repository.core.support.RepositoryFactorySupport;
@NoRepositoryBean
public class BaseDaoFactoryBean<R extends JpaRepository<T, I>, T, I extends Serializable>
extends JpaRepositoryFactoryBean<R, T, I> {

@SuppressWarnings("rawtypes")
@Override
protected RepositoryFactorySupport createRepositoryFactory(EntityManager entityManager) {

  return new BaseDaoFactory(entityManager);
}

private static class BaseDaoFactory<T, I extends Serializable> extends JpaRepositoryFactory {

  private EntityManager entityManager;

  public BaseDaoFactory(EntityManager entityManager) {
    super(entityManager);

    this.entityManager = entityManager;
  }

  @SuppressWarnings("unchecked")
  @Override
	protected Object getTargetRepository(RepositoryInformation metadata) {
	  return new BaseDaoImpl<T, I>((Class<T>) metadata.getDomainType(), entityManager);
	}
  
  @Override
  protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {

    return BaseDao.class;
  }
}
}
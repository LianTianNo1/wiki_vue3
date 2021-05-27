package com.wzy.wiki.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class EbookSnapshotExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EbookSnapshotExample() {
        oredCriteria = new ArrayList<>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andEbookIdIsNull() {
            addCriterion("ebook_id is null");
            return (Criteria) this;
        }

        public Criteria andEbookIdIsNotNull() {
            addCriterion("ebook_id is not null");
            return (Criteria) this;
        }

        public Criteria andEbookIdEqualTo(Long value) {
            addCriterion("ebook_id =", value, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdNotEqualTo(Long value) {
            addCriterion("ebook_id <>", value, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdGreaterThan(Long value) {
            addCriterion("ebook_id >", value, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdGreaterThanOrEqualTo(Long value) {
            addCriterion("ebook_id >=", value, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdLessThan(Long value) {
            addCriterion("ebook_id <", value, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdLessThanOrEqualTo(Long value) {
            addCriterion("ebook_id <=", value, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdIn(List<Long> values) {
            addCriterion("ebook_id in", values, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdNotIn(List<Long> values) {
            addCriterion("ebook_id not in", values, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdBetween(Long value1, Long value2) {
            addCriterion("ebook_id between", value1, value2, "ebookId");
            return (Criteria) this;
        }

        public Criteria andEbookIdNotBetween(Long value1, Long value2) {
            addCriterion("ebook_id not between", value1, value2, "ebookId");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("`date` is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("`date` is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterionForJDBCDate("`date` =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("`date` <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterionForJDBCDate("`date` >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("`date` >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterionForJDBCDate("`date` <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("`date` <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterionForJDBCDate("`date` in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("`date` not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("`date` between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("`date` not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andViewCountIsNull() {
            addCriterion("view_count is null");
            return (Criteria) this;
        }

        public Criteria andViewCountIsNotNull() {
            addCriterion("view_count is not null");
            return (Criteria) this;
        }

        public Criteria andViewCountEqualTo(Integer value) {
            addCriterion("view_count =", value, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountNotEqualTo(Integer value) {
            addCriterion("view_count <>", value, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountGreaterThan(Integer value) {
            addCriterion("view_count >", value, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("view_count >=", value, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountLessThan(Integer value) {
            addCriterion("view_count <", value, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountLessThanOrEqualTo(Integer value) {
            addCriterion("view_count <=", value, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountIn(List<Integer> values) {
            addCriterion("view_count in", values, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountNotIn(List<Integer> values) {
            addCriterion("view_count not in", values, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountBetween(Integer value1, Integer value2) {
            addCriterion("view_count between", value1, value2, "viewCount");
            return (Criteria) this;
        }

        public Criteria andViewCountNotBetween(Integer value1, Integer value2) {
            addCriterion("view_count not between", value1, value2, "viewCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountIsNull() {
            addCriterion("vote_count is null");
            return (Criteria) this;
        }

        public Criteria andVoteCountIsNotNull() {
            addCriterion("vote_count is not null");
            return (Criteria) this;
        }

        public Criteria andVoteCountEqualTo(Integer value) {
            addCriterion("vote_count =", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountNotEqualTo(Integer value) {
            addCriterion("vote_count <>", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountGreaterThan(Integer value) {
            addCriterion("vote_count >", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("vote_count >=", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountLessThan(Integer value) {
            addCriterion("vote_count <", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountLessThanOrEqualTo(Integer value) {
            addCriterion("vote_count <=", value, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountIn(List<Integer> values) {
            addCriterion("vote_count in", values, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountNotIn(List<Integer> values) {
            addCriterion("vote_count not in", values, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountBetween(Integer value1, Integer value2) {
            addCriterion("vote_count between", value1, value2, "voteCount");
            return (Criteria) this;
        }

        public Criteria andVoteCountNotBetween(Integer value1, Integer value2) {
            addCriterion("vote_count not between", value1, value2, "voteCount");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseIsNull() {
            addCriterion("view_increase is null");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseIsNotNull() {
            addCriterion("view_increase is not null");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseEqualTo(Integer value) {
            addCriterion("view_increase =", value, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseNotEqualTo(Integer value) {
            addCriterion("view_increase <>", value, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseGreaterThan(Integer value) {
            addCriterion("view_increase >", value, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseGreaterThanOrEqualTo(Integer value) {
            addCriterion("view_increase >=", value, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseLessThan(Integer value) {
            addCriterion("view_increase <", value, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseLessThanOrEqualTo(Integer value) {
            addCriterion("view_increase <=", value, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseIn(List<Integer> values) {
            addCriterion("view_increase in", values, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseNotIn(List<Integer> values) {
            addCriterion("view_increase not in", values, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseBetween(Integer value1, Integer value2) {
            addCriterion("view_increase between", value1, value2, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andViewIncreaseNotBetween(Integer value1, Integer value2) {
            addCriterion("view_increase not between", value1, value2, "viewIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseIsNull() {
            addCriterion("vote_increase is null");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseIsNotNull() {
            addCriterion("vote_increase is not null");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseEqualTo(Integer value) {
            addCriterion("vote_increase =", value, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseNotEqualTo(Integer value) {
            addCriterion("vote_increase <>", value, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseGreaterThan(Integer value) {
            addCriterion("vote_increase >", value, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseGreaterThanOrEqualTo(Integer value) {
            addCriterion("vote_increase >=", value, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseLessThan(Integer value) {
            addCriterion("vote_increase <", value, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseLessThanOrEqualTo(Integer value) {
            addCriterion("vote_increase <=", value, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseIn(List<Integer> values) {
            addCriterion("vote_increase in", values, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseNotIn(List<Integer> values) {
            addCriterion("vote_increase not in", values, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseBetween(Integer value1, Integer value2) {
            addCriterion("vote_increase between", value1, value2, "voteIncrease");
            return (Criteria) this;
        }

        public Criteria andVoteIncreaseNotBetween(Integer value1, Integer value2) {
            addCriterion("vote_increase not between", value1, value2, "voteIncrease");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {
        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
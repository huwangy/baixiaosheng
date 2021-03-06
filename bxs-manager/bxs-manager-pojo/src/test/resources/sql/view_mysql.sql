DROP TABLE V_USER_INFO;
CREATE VIEW V_USER_INFO AS 
SELECT M.*,N.POST_NAME FROM V_USER_INFO_PART M LEFT JOIN T_POST N ON M.POST_ID=N.ID;

DROP TABLE V_LINK_INFO;
CREATE OR REPLACE VIEW V_LINK_INFO AS
SELECT T.*,S.LINK_TYPE_NAME FROM T_LINK T LEFT JOIN T_LINK_TYPE S ON T.LINK_TYPE_ID=S.ID;

DROP TABLE V_POST_INFO;
CREATE OR REPLACE VIEW V_POST_INFO AS
SELECT T.*,S.DEPT_NAME FROM T_POST T LEFT JOIN T_DEPT S ON T.DEPT_ID=S.ID;


CREATE VIEW V_ARTICLE_TOPIC AS
SELECT 
      T.*,
      S.TOPIC_NAME,
      S.TOPIC_CODE,
      SUBSTRING(T.ARTICLE_CONTENT,LOCATE('SRC="',T.ARTICLE_CONTENT)+5,58) AS CONTENT_IMAGE_URL 
    FROM
      T_ARTICLE T 
      LEFT JOIN T_TOPIC S 
        ON T.TOPIC_ID = S.ID;


CREATE VIEW V_ARTICLE_DEPT AS
SELECT 
    M.*,
    N.DEPT_NAME AS PUBLISH_DEPT_NAME 
  FROM
    V_ARTICLE_TOPIC M 
    LEFT JOIN T_DEPT N 
      ON M.PUBLISH_DEPT_ID = N.ID;

CREATE OR REPLACE VIEW V_ARTICLE_INFO AS 
SELECT 
  J.*,
  K.USER_NAME AS PUBLISH_USER_NAME 
FROM
  V_ARTICLE_DEPT J 
  LEFT JOIN T_USER K 
    ON J.PUBLISH_USER_ID = K.ID ;
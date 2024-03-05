CREATE PROCEDURE FindTop5SimilarVectors
AS
BEGIN
    DECLARE @Vector1 NVARCHAR(MAX)
    DECLARE @VectorId INT
    DECLARE @Vectors TABLE (Id INT, Vector NVARCHAR(MAX))

    -- Get the vector with Id=1
    SELECT @Vector1 = Vector
    FROM Vectors
    WHERE Id = 1

    -- Insert all vectors into a temporary table
    INSERT INTO @Vectors (Id, Vector)
    SELECT Id, Vector
    FROM Vectors
    WHERE Id != 1

    -- Calculate cosine similarity and select top 5 similar vectors
    SELECT TOP 5 Id
    FROM @Vectors
    ORDER BY dbo.CosineSimilarity(@Vector1, Vector) DESC
END